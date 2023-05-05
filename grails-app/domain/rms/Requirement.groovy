package rms

class Requirement {
    String code
    String title
    String description
    String userStory
    RequirementType type
    RequirementOrigin origin
    Priority priority

    static belongsTo = [project: Project]

    static constraints = {
        code unique: true
        title nullable: false
        description nullable: true
        userStory nullable: true
        type nullable: true
        origin nullable: true
        priority nullable: true
    }
}
