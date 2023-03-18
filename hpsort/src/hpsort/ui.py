import functools
from time import sleep

from rich.console import Console as RichConsole

from hpsort.houses import House


@functools.lru_cache
def get_house_decoration(house: House) -> tuple[str, str]:
    match house:
        case House.GRYFFINDOR:
            return "dark_orange", "🦁"
        case House.HUFFLEPUFF:
            return "yellow", "🦡"
        case House.RAVENCLAW:
            return "blue", "🐦"
        case House.SLYTHERIN:
            return "green", "🐍"


class Console:
    def __init__(self) -> None:
        self.console = RichConsole()

    def _dumbledore(self, msg: str, color="rosy_brown"):
        self.console.print(f"🧙: [{color}]{msg}")

    def _sorting_hat(self, msg: str, color: str = "wheat4"):
        self.console.print(f"🎩: [{color}]{msg}")

    def introduction(self):
        """Introduces the student to Hogwarts."""
        self._dumbledore("Welcome to Hogwarts!")
        self._dumbledore("My name is Dumbledore, headmaster of the school.")
        self._dumbledore("What is your your name, young student?")
        self.console.print()

    def greeting(self, name: str):
        """Greets the student by name and takes them to the Sorting Hat."""
        self.console.print()
        self._dumbledore(f"{name} is a lovely name!")
        sleep(1)
        self._dumbledore("Follow me. I'll take you to the Sorting Hat.")
        sleep(1)
        self._dumbledore("He will tell us to which House you belong to.")
        sleep(2)
        with self.console.status("[bold green]🚶 Walking to meet the Sorting Hat..."):
            steps = 3
            while steps:
                steps -= 1
                sleep(1)
        self.console.print()

    def hat_thinking(self):
        """Hat thinks about what House the student should belong to."""
        self._sorting_hat("Let's see which house we should assign you...")

        messages = ["...thinking", "...still thinking", "AH HA! I know it now!"]
        with self.console.status("[bold green]💭 Hat is thinking ..."):
            while messages:
                message = messages.pop(0)
                self._sorting_hat(message)
                sleep(2)

        self._sorting_hat("You belong to...")
        sleep(2)

    def house_selection(self, house: House):
        """House selection is announced."""
        color, emoji = get_house_decoration(house)
        self._sorting_hat(f"{house.value} {emoji}!", color=color)
        sleep(2)
        self.console.print()

    def conclusion(self, house: House):
        """Dumbledore congratulates as all houses cheer."""
        messages = [
            f"{house.value} is a lovely house.",
            "Go join your friends at the your table.",
        ]
        with self.console.status(
            "[bold green]👏 All of Hogwarts is cheering (except Malfoy)..."
        ):
            while messages:
                message = messages.pop(0)
                self._dumbledore(message)
                sleep(3)
