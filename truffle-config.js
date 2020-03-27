const path = require("path");

module.exports = {
    // Add comma after 'contracts_build_directory' statement
    contracts_build_directory: path.join(__dirname, "client/src/contracts"),
    networks: {
    MyGanacheNetwork: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*"
    },
    test: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*"
    }
   }
};

