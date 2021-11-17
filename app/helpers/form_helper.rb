module FormHelper
  def show_form_errors(record)
    return if record.errors.empty?
    render partial: 'helpers/show_form_errors', locals: { record: record }
  end
end
