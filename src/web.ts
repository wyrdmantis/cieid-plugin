import { WebPlugin } from '@capacitor/core';

export class CieIdPluginWeb extends WebPlugin {
  async authenticate(options: { serviceProviderUrl: string }): Promise<{ status: string }> {
    console.log("Web not supported for CieID authentication", options);
    return { status: "unsupported" };
  }
}
