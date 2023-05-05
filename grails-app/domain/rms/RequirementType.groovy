package rms

class RequirementType {
    String name

    static constraints = {
        name unique: true
    }

    @Override
    String toString() {
        return name
    }
}
