var errorCodes = {
  'RangeError (index): Invalid value: Valid value range is empty: 0': 'There are not any items',
  'RangeError (length): Invalid value: Valid value range is empty: 0': 'There are not any items'
};

class ErrorHandler {
  static String returnErrorString(String errorTxt){
    try {
      for (int i = 0; i < errorCodes.length; i++){
      if (errorCodes.containsKey(errorTxt)){
        return errorCodes[errorTxt];
      }
    }
    } catch (e) {
      return e;
    }
    return errorTxt;
  }
}