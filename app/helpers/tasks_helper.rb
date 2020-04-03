module TasksHelper

  def sort_desc(sort_column)
    link_to(" ▼",tasks_path(sort_column: sort_column, sort_direction: "desc"))
  end

  def sort_asc(sort_column)
    link_to("▲", tasks_path(sort_column: sort_column, sort_direction: "asc"))
  end

end
