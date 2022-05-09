cd contracts/circuits/LessThan10


# generate witness
node "LessThan10_js/generate_witness.js" LessThan10_js/LessThan10.wasm input.json witness.wtns

# generate proof
snarkjs plonk prove circuit_final.zkey witness.wtns proof.json public.json

# verify proof
snarkjs plonk verify verification_key.json public.json proof.json

# generate call
snarkjs zkey export soliditycalldata public.json proof.json > call.txt