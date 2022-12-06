const FacuetContract = artifacts.require("Faucet")

module.exports = function (deployer) {
    deployer.deploy(FacuetContract)
}

