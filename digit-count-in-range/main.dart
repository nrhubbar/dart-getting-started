

BigInt nine = BigInt.from(9);
BigInt ten = BigInt.from(10);

main(List<String> args) {

  BigInt dynamicCount = BigInt.zero;
  BigInt bestCount = BigInt.zero;
  BigInt LIMIT = BigInt.from(10).pow(5);
  try {
    for(BigInt i = BigInt.one; i < LIMIT; i = i + BigInt.one) {
      digitsInMagnitudeDynamic(i);
      dynamicCount = dynamicCount + BigInt.one;
      print(i);
    }
  } catch(e) {
    print(e.toString());
  }
  print("Dynamic Count: $dynamicCount");

  try {
    for(BigInt i = BigInt.one; i < LIMIT; i = i + BigInt.one) {
      digitsInMagnitudeRecursive(i);
      bestCount = bestCount + BigInt.one;
      //print(i);
    }
  } catch(e) {
    print(e.toString());
  }

  print("Best Count: $bestCount");

  
}

int digitsInMagnitudeBrute(int magnitude) {
  const String RANDOM_INT = "5";
  int count = 0;
  int max = ten.pow(magnitude).toInt();
  for(int i = 0; i < max; i++) {
    if (i.toString().contains(RANDOM_INT)) {
      count++;
    }
  }
  return count;
}

int digitsInMagnitudeHackathon(int magnitude) {
  switch (magnitude) {
    case 0:
      return 0;
    case 1:
      return 1;
    case 2:
      return 19;
    default:
      return throw new ArgumentError("Magnitude too High");
  }
}

Map<BigInt, BigInt> resultStore = {BigInt.from(1) : BigInt.from(1)};
BigInt digitsInMagnitudeDynamic(BigInt magnitude) {

  if (resultStore.containsKey(magnitude)) {
    return resultStore[magnitude];
  } else {
    BigInt result = (digitsInMagnitudeDynamic(magnitude - BigInt.one) * nine) + ten.pow(magnitude.toInt() - 1);
    resultStore[magnitude] = result;
    return result;
  }
}

BigInt digitsInMagnitudeRecursive(BigInt magnitude) {
  if (magnitude <= BigInt.one) {
    return BigInt.one;
  } else {
    return (digitsInMagnitudeRecursive(magnitude - BigInt.one) * nine) + ten.pow(magnitude.toInt() - 1);
  }
}
