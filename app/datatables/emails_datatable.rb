class EmailsDatatable < AjaxDatatablesRails
  
  def initialize(view)
    @model_name = Email
    @columns = [emails.emailAddress]
    @searchable_columns = [emails.emailAddress]
    super(view)
  end
  
private

    def data
      emails.map do |email|
        [
          email.emailAddress
        ]
      end
    end

    def emails
      @emails ||= fetch_records
    end

    def get_raw_records
      Email.all
    end
    
    def get_raw_record_count
      search_records(get_raw_records).count
    end
    
    # ==== Insert 'presenter'-like methods below if necessary
end

