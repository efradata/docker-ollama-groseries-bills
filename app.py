import streamlit as st
from PIL import Image

# Título de la app
st.title("📤 Load the bill")

# Widget para subir archivos (solo imágenes)
uploaded_file = st.file_uploader(
    "Sube una imagen", 
    type=["jpg", "jpeg", "png"],
    help="Formatos soportados: JPG, JPEG, PNG"
)

if uploaded_file is not None:
    try:
        # Mostrar la imagen subida
        image = Image.open(uploaded_file)
        st.image(image, caption="Imagen subida", use_column_width=True)
    except Exception as e:
        st.error(f"Error al cargar la imagen: {str(e)}")