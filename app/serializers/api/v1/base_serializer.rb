class Api::V1::BaseSerializer < ActiveModel::Serializer
  attribute :meta

  def meta
    meta = {}

    if @options[:meta]
      # Build out a pagination object if a collection was passed to the meta builder
      if @options[:meta][:pagination]
        # Set the universally namespaced attributes
        meta[:page] = @options[:meta][:pagination].current_page
        meta[:total_pages] = @options[:meta][:pagination].total_pages
        meta[:total] = @options[:meta][:pagination].total_entries
      end
      # Delete the objects we have custom parsing for
      @options[:meta].delete(:pagination)
    end

    # Add any additional meta data to the final result
    meta = meta.merge(@options[:meta]) if @options[:meta]

    # Return the final meta object
    meta
  end

  def attributes
    hash = super

    # Dynamically generate JSON output based on the avaliable data
    @options[:output].each do |output|
      if output[:model].is_a?(Array) || output[:model].is_a?(ActiveRecord::Relation)
      #if output[:model].is_a?(Array) || output[:model].is_a?(ActiveRecord::Relation)
        hash[output[:key]] = []
        output[:model].each do |model|
          hash[output[:key]] << output[:serializer].new(model, @options)
        end
      else
        hash[output[:key]] = output[:serializer].new(output[:model], @options)
      end
    end if @options[:output]

    hash
  end
end