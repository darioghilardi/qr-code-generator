import {getInput, setOutput, group, info} from '@actions/core'
import * as QRCode from 'qrcode'

export async function run(): Promise<void> {
  const content = getInput('content', {required: true})
  info(`Generating a QR Code for the following content: ${content}`)

  const data = await group('Create Base64', () => QRCode.toDataURL(content))
  const text = await group('Create QR Text', () => QRCode.toString(content, {type: "terminal"}))
  console.log(data)
  console.log(text)

  setOutput('data', data)
  setOutput('text', text)
}
