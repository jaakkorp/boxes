var KCurrentColor = "currentColor"
var KData = "data"

function colorName(colorCode) {
    if (colorCode === "#0000ff")
        return "BLUE"
    else if (colorCode === "#008000")
        return "GREEN"
    else if (colorCode === "#ff0000")
        return "RED"
    else if (colorCode === "#ffff00")
        return "YELLOW"
    else
        return "unknown"
}

function boxCountInfoText(boxCount) {
    return boxCount === 1 ? "There is 1 box"
                          : "There are " + boxCount + " boxes"
}

function currentColorInfoText(colorCode) {
    return "Current color is " + colorName(colorCode)
}
