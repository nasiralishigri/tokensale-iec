  const { expect } = require("chai");
  
  describe("TokenSale", function () {
    let bep20;
    beforeEach(async function(){
        const [owner, acc1, acc2, acc3] = await ethers.getSigners();
        const BEP20 = await ethers.getContractFactory("BEP20");
         bep20 = await BEP20.deploy();
         console.log(`Token is Deployed Address:${bep20.address}`)

         const TokenSale = await ethers.getContractFactory("TokenSale");
         tokenSale = await TokenSale.deploy(bep20.address);
         console.log(`Token is Deployed Address:${tokenSale.address}`)

    })
    describe("Purchase Token", function(){
        it("Its purchase token in Phase 1", async function(){
            let newOwner = tokenSale.address;
            await bep20.transferOwnership(newOwner);
            
            let oneTokenAmount = 5000000000000000;
            await tokenSale.buyToken({value:oneTokenAmount});

        })
    })
  });
  