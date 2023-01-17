async function main() {
    const address = undefined // fill this in with your instance

    // in case you want to call functions against Target from here as well...
    // const Target = await hre.ethers.getContractFactory('RawTransaction')
    // const target = await Target.attach(address)

    console.log('deploying...')
    const Solve = await hre.ethers.getContractFactory('RawTransactionSolve')
    const solve = await Solve.deploy()
    await solve.deployed()

    console.log('running...')
    await solve.run(address)
}

main().catch((error) => {
    console.error(error)
    process.exitCode = 1
})
