class Document < ActiveRecord::Base
  
  mount_uploader :project_doc, DocumentUploader
  attr_accessible :content_type, :file_size, :project_doc, :project_id, :thumb, :document_category
  
  belongs_to :project

  before_save :update_project_doc_attributes
  
  def default_name
    self.name ||= File.basename(bid_doc.filename, '.*').titleize if document
  end
  
  
  private

    def update_project_doc_attributes
      if project_doc.present? && project_doc_changed?
        self.content_type = project_doc.file.content_type
        self.file_size = project_doc.file.size
      end
    end  
  
end
