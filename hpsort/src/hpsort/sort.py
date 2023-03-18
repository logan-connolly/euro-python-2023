from hpsort.houses import House


def sort_student(name: str) -> House:
    """Sort a student to a Hogwarts house."""
    match len(name):
        case 4:
            return House.GRYFFINDOR
        case 5:
            return House.HUFFLEPUFF
        case 6:
            return House.RAVENCLAW
        case _:
            return House.SLYTHERIN
