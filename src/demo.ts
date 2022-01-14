import { database } from './infrastructure/database'

const main = async () => {
  const result = await database.user.findMany()
  console.log(result)
}

main().catch((e) => {
  console.log(e)
  process.exit(1)
}).then(() => {
  process.exit(0)
})
