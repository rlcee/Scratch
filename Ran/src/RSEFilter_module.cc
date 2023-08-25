//
// general filter for run, subruns, events
//

#include "art/Framework/Core/EDFilter.h"
#include "art/Framework/Principal/Event.h"
#include "messagefacility/MessageLogger/MessageLogger.h"
#include <iostream>
#include <vector>

using namespace std;

namespace mu2e {

  class RSEFilter : public art::EDFilter {
  public:
    explicit RSEFilter(fhicl::ParameterSet const& pset);
    virtual ~RSEFilter() { }

    bool filter( art::Event& event);

  private:

    bool _verbose;
  };

  RSEFilter::RSEFilter(fhicl::ParameterSet const& pset):
    art::EDFilter{pset},
    _verbose(pset.get<bool>("verbose",true)) {
  }

  bool RSEFilter::filter(art::Event& event) {

    unsigned ievent = event.event();
    if(ievent>50){
      if(_verbose) std::cout << "selected event " << ievent << std::endl;
      return true;
    } else
      return false;

  }

}

using mu2e::RSEFilter;
DEFINE_ART_MODULE(RSEFilter)
