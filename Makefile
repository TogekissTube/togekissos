# Nombre del binario de salida
BOOT_BIN = boot.bin

# Directorio de origen
SRC_DIR = src

# Archivos fuente
BOOT_SRC = $(SRC_DIR)/boot.S

# Compiladores y enlazadores
AS = as
LD = ld

# Opciones de compilación
ASFLAGS = 
LDFLAGS = -Ttext 0x7C00 --oformat=binary

# Regla por defecto
all: $(BOOT_BIN)

# Regla para compilar el archivo boot.S
$(BOOT_BIN): boot.o
	$(LD) $(LDFLAGS) -o $(BOOT_BIN) boot.o

boot.o: $(BOOT_SRC)
	$(AS) $(ASFLAGS) -o boot.o $(BOOT_SRC)

# Limpiar archivos generados
clean:
	rm -f boot.o $(BOOT_BIN)

# Phony targets
.PHONY: all clean
