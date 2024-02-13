import { ChatProps } from "./Chat";

export interface CustomHooks {
  Chat: {
    mounted(): void;
    destroyed(): void;
    addMessage(message: string): void;
    getProps(messages: string[]): ChatProps;
  };
}
