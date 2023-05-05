package rms

class Priority {
    String level

    static constraints = {
        level unique: true
    }
}
