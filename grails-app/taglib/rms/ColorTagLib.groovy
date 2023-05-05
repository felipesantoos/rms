package rms

class ColorTagLib {
    static namespace = "color"

    def color = { attrs ->
        out << "<input type='color' name='${attrs.name}' value='${attrs.value}'/>"
    }
}
