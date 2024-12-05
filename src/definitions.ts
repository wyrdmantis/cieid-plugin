export interface CieIdPlugin {
  authenticate(options: { serviceProviderUrl: string }): Promise<{ status: string; url?: string }>;
}
