package rms

class RequirementOrigin {
    String name

    static constraints = {
        name unique: true
    }

    @Override
    String toString() {
        return name
    }
}
