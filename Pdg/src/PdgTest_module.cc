///////////////////////////////////////////////////////////////////////////////
//
///////////////////////////////////////////////////////////////////////////////

// C++ includes
#include <iostream>
#include <stdexcept>
#include <string>

// Framework includes
#include "art/Framework/Core/EDAnalyzer.h"
#include "art/Framework/Principal/Event.h"
#include "fhiclcpp/ParameterSet.h"
#include "fhiclcpp/types/Atom.h"
#include "fhiclcpp/types/Sequence.h"

#include "Offline/ProditionsService/inc/ProditionsHandle.hh"
#include "Offline/GlobalConstantsService/inc/GlobalConstantsHandle.hh"
#include "Offline/GlobalConstantsService/inc/ParticleDataList.hh"


namespace mu2e {

class PdgTest : public art::EDAnalyzer {
 public:
  struct Config {
    using Name = fhicl::Name;
    using Comment = fhicl::Comment;

    fhicl::Atom<int> verbose{Name("verbose"), Comment("verbose flag, 0 to 10"),
                             1};
  };

  // this line is required by art to allow the command line help print
  typedef art::EDAnalyzer::Table<Config> Parameters;

  explicit PdgTest(const Parameters& conf) :
      art::EDAnalyzer(conf), _conf(conf()) {}

  ~PdgTest() {}
  void analyze(const art::Event& event) override;

 private:
  Config _conf;

  // ProditionsHandle<StrawResponse> _testh;
  //ProditionsHandle<STMEnergyCalib> _testh;

};

//-----------------------------------------------------------------------------
void PdgTest::analyze(const art::Event& event) {
  std::cout << "PdgTest::analyze  " << event.id() << std::endl;

  GlobalConstantsHandle<ParticleDataList> pdt;
  pdt->printTable();


}

}  // namespace mu2e

DEFINE_ART_MODULE(mu2e::PdgTest);
