class Fill < ApplicationRecord
  scope :success, ->{ where(status: "success") }

  def self.recent(bio_id)
    form = CongressForms::Form.find(bio_id)
    where(bioguide_id: bio_id).where("created_at > ?", form.updated_at)
  end

  def success?
    status == "success"
  end

  def error?
    status == "error"
  end

  def failure?
    status == "failure"
  end
end
