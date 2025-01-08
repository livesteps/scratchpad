int main()
{
    init_platform();
    u8 wdat[2] = {0xFF,0x00};


    XIic *Iic;
    XIic_Config *ConfigPtr;
    ConfigPtr = XIic_LookupConfig(XPAR_IIC_0_DEVICE_ID);
    XIic_CfgInitialize(Iic, ConfigPtr, ConfigPtr->BaseAddress);
    u32 CntlReg = XIic_ReadReg(Iic->BaseAddress, XIIC_CR_REG_OFFSET);
    CntlReg &= ~XIIC_CR_NO_ACK_MASK;
    XIic_WriteReg(Iic->BaseAddress, XIIC_CR_REG_OFFSET, CntlReg);
    XIic_Start(Iic);
    XIic_SetAddress(Iic, XII_ADDR_TO_SEND_TYPE, 0x61);
    XIic_MasterSend(Iic, wdat, 1);

    cleanup_platform();
    return 0;
}
