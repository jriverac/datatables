class DatatablesGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :model, type: :string
  argument :skip, type: :string

  def generate_init
    @skip_columns = skip.split(',').map(&:lstrip)
  end

  def generate_model
    generate_datatable unless model == 'init'
  end

  private

  def generate_datatable
    template 'model_datatable_table.template', "app/views/#{model.pluralize}/_datatable_table.html.haml"
    template 'model_datatable_header.template', "app/views/#{model.pluralize}/_datatable_header.html.haml"
    template 'model_datatable_footer.template', "app/views/#{model.pluralize}/_datatable_footer.html.haml"
    template 'model_datatable_model.template', "app/views/#{model.pluralize}/_datatable_#{model}.html.haml"
  end
end
