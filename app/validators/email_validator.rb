class EmailValidator < ActiveModel::Validator

  def validate(record)
    if record.image_url.blank?
      record.errors[:base] << "图片地址为空，请输入"
    end
  end
end