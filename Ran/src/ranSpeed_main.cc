#include "CLHEP/Random/RandomEngine.h"
#include "CLHEP/Random/JamesRandom.h"
#include "CLHEP/Random/MixMaxRng.h"
#include <iostream>

using namespace CLHEP;

int main() {

  //HepJamesRandom engine;
  MixMaxRng engine;
  long seeds[4];
  for(long i=1; i<1000001; i++) {
    //engine.setSeed(i);
    for(size_t j=0; j<4; j++) seeds[j] = i;
    engine.setSeeds(seeds,3);
  }

  return 0;
}
