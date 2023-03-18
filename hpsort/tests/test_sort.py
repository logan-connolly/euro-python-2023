import pytest

from hpsort.sort import House, sort_student


@pytest.mark.parametrize(
    "name,want",
    [
        ("Joe", House.SLYTHERIN),
        ("Mary", House.GRYFFINDOR),
        ("Jacob", House.HUFFLEPUFF),
        ("Marcus", House.RAVENCLAW),
        ("Samantha", House.SLYTHERIN),
    ],
)
def test_sort_student(name, want):
    """Test that students are assigned the proper House."""
    got = sort_student(name)
    assert got == want
