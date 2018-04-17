class Writer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, uniqueness: { case_sensitive: false }, length: { in: 1..30 }

  has_many :stories, dependent: :destroy

  # This returns a chart for visible, shareable work such that a user can see the full activity to date
  def custom_created_date_json_to_date(bool_show_all)
    if bool_show_all #If everything needs to be shown, then no where clause is needed
      writer_date = self.stories.order(:created_at).first&.created_at || []
    else
      writer_date = self.stories.where(share_work: true).order(:created_at).first.created_at || []
    end
    custom_created_date_json = {}
    while writer_date != [] && writer_date <= DateTime.now
      custom_created_date_json[writer_date] = self.stories.where(share_work: true).where(created_at: (writer_date.midnight)..(writer_date.midnight + 1.day)).count
      writer_date = writer_date + 1.day
    end
    custom_created_date_json
  end

  def custom_stories_by_word_count_json(bool_show_all)
    if bool_show_all #If everything needs to be shown, then no where clause is needed
      stories_to_render = self.stories
    else
      stories_to_render = self.stories.where(share_work: true)
    end
    custom_stories_by_word_count_json = {}
    stories_to_render.each do |story|
      custom_stories_by_word_count_json[story.title] = story.description.split.count
    end
    custom_stories_by_word_count_json
  end
end
