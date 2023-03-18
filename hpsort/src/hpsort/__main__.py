from hpsort import sort, ui


def main():
    console = ui.Console()
    console.introduction()
    name = input("💭: ")
    console.greeting(name)
    console.hat_thinking()
    house = sort.sort_student(name)
    console.house_selection(house)
    console.conclusion(house)


if __name__ == "__main__":
    raise SystemExit(main())
