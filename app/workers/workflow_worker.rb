require 'json'

class WorkflowWorker

  @queue = "workflow"

  def self.perform(message)
	puts 'received message'    

	begin
      json_s = message.first.to_json
	  json = JSON.parse json_s
	  
      creators             = json['creator']
      keywords             = json['keyword']
      rights               = json["rights"]
      subjects             = json["subject"]
      languages            = json["language"]
      departments          = json["department"]
      advisors             = json["advisor"]

      visibility           = json["visibility"]
      preflabel            = json["preflabel"]
      abstract             = json["abstract"]
      qualification_name   = json["qualification_name"]
      qualification_level  = json["qualification_level"]
      date_of_award        = json["date_of_award"]
      awarding_institution = json["awarding_institution"]

puts '--Creator--'	  
puts creators.class
puts creators
puts '--Keyword--'
puts keywords.class
puts keywords

    puts "Successfully processed message."

    rescue Exception => e
      puts e.message
    end
	
  end

end
