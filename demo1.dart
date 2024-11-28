void main() {
  Guitar guitar = Guitar();
  guitar.tuneInstrument();
}

interface class Tuner {
  void tuneInstrument() {
    print('Tuning the instrument');
  }
}

class Guitar implements Tuner {
  @override
  void tuneInstrument() {
    print('Tuning the guitar');
  }
}
