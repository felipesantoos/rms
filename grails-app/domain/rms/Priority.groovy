package rms

class Priority {
    String level

    static constraints = {
        level unique: true
    }

    @Override
    String toString() {
        return level
    }
}
