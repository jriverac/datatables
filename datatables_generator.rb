class DatatablesGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :model, type: :string
  argument :detail_link_column, type: :string
  argument :include_columns, type: :string

  def generate_init
    @include_columns = include.split(',').map(&:lstrip)
    @detail_link_column = detail_link_column.to_s
    @model = model.to_s
    @the_model = Object.const_get model.to_s
  end

  def generate_model
    generate_datatable unless model == 'init'
  end

  private

  def generate_datatable
    template 'model_datatable_table.template', "app/views/#{model.pluralize.underscore}/_datatable_table.html.haml"
    template 'model_datatable_header.template', "app/views/#{model.pluralize.underscore}/_datatable_header.html.haml"
    template 'model_datatable_footer.template', "app/views/#{model.pluralize.underscore}/_datatable_footer.html.haml"
    template 'model_datatable_model.template', "app/views/#{model.pluralize.underscore}/_datatable_#{model.underscore}.html.haml"
  end
end
