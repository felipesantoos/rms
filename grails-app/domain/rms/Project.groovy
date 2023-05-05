package rms

class Project {
    String name
    String alias
    String description
    boolean isActive

    static constraints = {
        name nullable: false
        alias nullable: false
        description nullable: true
        isActive inList: [true, false]
    }
}
