module SessionsHelper
  def error(obj)
    obj.error_notification message: obj.object.errors[:base].to_sentence if obj.object.errors[:base].present?
  end
end
