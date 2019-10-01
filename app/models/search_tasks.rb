class SearchTasks
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :status, :integer

  def search
    tasks = Task.joins_includes

    tasks = tasks.search_name(name) if name.present?
    tasks = tasks.search_status(status) if status.present?
    tasks
  end

end
