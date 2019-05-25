class Flames {
  final String firstName;
  final String secondName;

  Flames(this.firstName, this.secondName);

  getflames() {
    int count = flamesCount(firstName, secondName);
    String result = flamesResult(count);
    String flames = flamesMatch(result);

    print(count);
    print(result);
    return flames;
  }

  int flamesCount(String firstname, String secondname) {
    int matchletterscount;

    List<String> firstnamelist;
    List<String> secondnamelist;

    firstname.split('');
    secondname.split('');

    firstnamelist = firstname.codeUnits.map((unit) {
      return new String.fromCharCode(unit);
    }).toList();

    secondnamelist = secondname.codeUnits.map((unit) {
      return new String.fromCharCode(unit);
    }).toList();

    for (int i = 0; i < firstnamelist.length; i++) {
      if (secondnamelist.contains(firstnamelist[i])) {
        secondnamelist.remove(firstnamelist[i]);
        firstnamelist.removeAt(i);
        i = 0;
      }
    }

    firstnamelist.forEach((element) => print(element));
    secondnamelist.forEach((element) => print(element));

    matchletterscount = firstnamelist.length + secondnamelist.length;

    return matchletterscount;
  }

  String flamesResult(int count) {
    List<String> flamesList = ['F', 'L', 'A', 'M', 'E', 'S'];
    while (flamesList.length > 1) {
      int removeCount = count;
      if (count > (flamesList.length)) {
        removeCount = count % (flamesList.length);
        if (removeCount == 0) {
          removeCount = (flamesList.length);
        }
      }
      flamesList.remove(flamesList[removeCount - 1]);
    }

    return flamesList[0];
  }

  String flamesMatch(String char) {
    String flames;
    switch (char) {
      case 'F':
        {
          flames = 'Friends';
        }
        break;

      case 'L':
        {
          flames = 'Love';
        }
        break;

      case 'A':
        {
          flames = 'Affection';
        }
        break;
      case 'M':
        {
          flames = 'Marriage';
        }
        break;

      case 'E':
        {
          flames = 'Enemies';
        }

        break;
      default:
        {
          flames = 'Sister/Siblings';
        }
        break;
    }

    return flames;
  }
}
