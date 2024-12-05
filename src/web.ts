import { WebPlugin } from '@capacitor/core';

import type { CieIdPlugin } from './definitions';

export class CieIdWeb extends WebPlugin implements CieIdPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
