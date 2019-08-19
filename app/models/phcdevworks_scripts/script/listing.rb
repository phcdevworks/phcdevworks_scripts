module PhcdevworksScripts
  class Script::Listing < ApplicationRecord
  
    # Clean URL Initialize
    extend FriendlyId

    # Paper Trail Initialize
    has_paper_trail :class_name => 'PhcdevworksScripts::ListingVersions'

    # Relationships
    has_many :urls, class_name: 'PhcdevworksScripts::Script::Url', :dependent => :destroy
    belongs_to :author, class_name: 'PhcdevworksScripts::Script::Author'
    belongs_to :licence, class_name: 'PhcdevworksScripts::Script::Licence'

    # Form Fields Validation
    validates :listing_title,
      presence: true

    validates :listing_description,
      presence: true

    validates :listing_script_source,
      format: { with: URI::regexp(%w(http https)), message: "Please follow this URL format http or https://www.**********.com" }

    validates :listing_script_website,
      format: { with: URI::regexp(%w(http https)), message: "Please follow this URL format http or https://www.**********.com" }

    validates :listing_script_repo,
      format: { with: URI::regexp(%w(http https)), message: "Please follow this URL format http or https://www.**********.com" }

    # Clean URL Define
    friendly_id :phc_nice_url_slug, use: [:slugged, :finders]

    def phc_nice_url_slug
      [:listing_title]
    end

  end
end
