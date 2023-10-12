// This is a Truffle JavaScript deployment script
const MultiSignatureWallet = artifacts.require("MultiSignatureWallet");

module.exports = function (deployer) {
  const initialOwners = [ownerAddress1, ownerAddress2, ownerAddress3]; // Replace with actual owner addresses
  const requiredSignatures = 2; // Replace with the required number of signatures

  deployer.deploy(MultiSignatureWallet, initialOwners, requiredSignatures);
};
