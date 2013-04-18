module ApplicationHelper
  def full_title(page_title)
    base_title = 'HD Build'
    if page_title.empty?
      base_title
    else  
      "#{base_title} | #{page_title}"
    end
  end
  
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def user_agent
    string = request.env['HTTP_USER_AGENT']
    user_agent = UserAgent.parse(string)
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end
  
  def extension_image(file)
      ext =File.extname(file)
      if ext == ".pdf"
        "pdf.png"
      elsif ext == ".doc"
       "doc.png"
      elsif ext == ".docx"
       "doc.png"
      elsif ext == ".dwg"
       "dwg.png"
      elsif ext == ".dxf"
       "dxf.png"
      elsif ext == ".ppt"
       "ppt.png"
      elsif ext == ".pptx"
       "ppt.png"
      elsif ext == ".rar"
       "rar.png"
     elsif ext == ".rtf"
      "rtf.png"
     elsif ext == ".txt"
      "txt.png"
     elsif ext == ".xls"
      "xls.png"
     elsif ext == ".xlsx"
      "xlsx.png"              
     elsif ext == ".zip"
      "zip.png"           
     else
      "_blank.png"
    end
  end

end
