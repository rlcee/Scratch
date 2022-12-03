#include "Offline/GlobalConstantsService/inc/GlobalConstantsHandle.hh"
#include "Offline/GlobalConstantsService/inc/ParticleDataList.hh"

#include <iostream>

using namespace mu2e;

int main() {

  GlobalConstantsHandle<ParticleDataList> pdt;
  pdt->printTable();
  return 0;
}
