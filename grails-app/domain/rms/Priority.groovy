package rms

class Priority {
    String level
    String color

    static constraints = {
        level unique: true
        color nullable: true
    }

    @Override
    String toString() {
        return level
    }
}
