class SkillsController < ApplicationController

   
     def index
        skills = Skill.all
        render json: skills, include: [:topics]
    end


    def show 
        skill = Skill.find_by(id: params[:id])
        render json: skill, include: [:links]
    end
   

    def create
      user = get_user
      topic = Topic.find_by(name: createTopic[:topic])
      months = Skill.calculateMonths(params[:duration])
      short_term = months < 1? true : false 
    
        skill = Skill.new(user_id: user.id, duration:months, short_term: short_term)
        skill.update(createSkillParams)
        TopicSkill.create(skill_id: skill.id , topic_id: topic.id)
        Link.createLinks(params[:links],skill.id )
     
     if  skill.save
        render json:skill.id
     else 
        render json:{errors: skill.errors.full_messages}
     end
    
    end 

    private 

    def createSkillParams 
        params.permit( :title, :description, :achievements, :difficulty, :advice, :methodology)
    end

    def createTopic
        params.permit(:topic )
    end 

end
