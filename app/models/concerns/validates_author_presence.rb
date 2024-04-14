module ValidatesAuthorPresence
    extend ActiveSupport::Concern

    included do
        validate :must_have_authors, on: :create
    end

    private

    def must_have_authors
        errors.add(:authors, "must be present") if authors.blank?
    end
end