package Telas;
import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import main.Livro;

import javax.swing.JTextField;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.JButton;
import java.awt.Font;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class CadastrarLivro extends JFrame {

	private JPanel contentPane;
	private JTextField autorLivro;
	private JTextField anoLancamento;
	private JTextField tituloLivro;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					CadastrarLivro frame = new CadastrarLivro();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public CadastrarLivro() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 406, 260);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		
		JLabel lblNewLabel = new JLabel("Autor do Livro:");
		
		autorLivro = new JTextField();
		autorLivro.setColumns(10);
		
		JLabel lblNewLabel_1 = new JLabel("Ano de Lan\u00E7amento:");
		
		anoLancamento = new JTextField();
		anoLancamento.setColumns(10);
		
		JButton btnIncluirLivro = new JButton("Incluir");
		btnIncluirLivro.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					cadastrarLivro();
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});
		
		JLabel lblNewLabel_2 = new JLabel("Titulo do Livro:");
		
		tituloLivro = new JTextField();
		tituloLivro.setColumns(10);
		
		JButton btnRevista = new JButton("Revista");
		btnRevista.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				CadastrarRevista cadastroRevista = new CadastrarRevista();
				cadastroRevista.setVisible(true);
				setVisible(false);
			}
		});
		
		JButton btnListagemLivros = new JButton("Listagem");
		btnListagemLivros.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Listagem listagem = new Listagem();
				listagem.setVisible(true);
				setVisible(false);
			}
		});
		
		JLabel lblNewLabel_3 = new JLabel("Livros");
		lblNewLabel_3.setFont(new Font("Tahoma", Font.PLAIN, 20));
		GroupLayout gl_contentPane = new GroupLayout(contentPane);
		gl_contentPane.setHorizontalGroup(
			gl_contentPane.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_contentPane.createSequentialGroup()
					.addGroup(gl_contentPane.createParallelGroup(Alignment.LEADING)
						.addGroup(gl_contentPane.createSequentialGroup()
							.addContainerGap()
							.addGroup(gl_contentPane.createParallelGroup(Alignment.LEADING)
								.addGroup(gl_contentPane.createSequentialGroup()
									.addGroup(gl_contentPane.createParallelGroup(Alignment.LEADING)
										.addGroup(gl_contentPane.createSequentialGroup()
											.addComponent(lblNewLabel)
											.addPreferredGap(ComponentPlacement.RELATED)
											.addComponent(autorLivro, GroupLayout.PREFERRED_SIZE, 262, GroupLayout.PREFERRED_SIZE))
										.addGroup(gl_contentPane.createSequentialGroup()
											.addComponent(btnIncluirLivro)
											.addGap(18)
											.addComponent(btnRevista, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
											.addGap(18)
											.addComponent(btnListagemLivros)
											.addGap(97))
										.addGroup(gl_contentPane.createSequentialGroup()
											.addComponent(lblNewLabel_2)
											.addPreferredGap(ComponentPlacement.RELATED)
											.addComponent(tituloLivro, GroupLayout.DEFAULT_SIZE, 263, Short.MAX_VALUE)))
									.addGap(145))
								.addGroup(gl_contentPane.createSequentialGroup()
									.addComponent(lblNewLabel_1)
									.addPreferredGap(ComponentPlacement.RELATED)
									.addComponent(anoLancamento, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))))
						.addGroup(gl_contentPane.createSequentialGroup()
							.addGap(164)
							.addComponent(lblNewLabel_3)))
					.addContainerGap())
		);
		gl_contentPane.setVerticalGroup(
			gl_contentPane.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_contentPane.createSequentialGroup()
					.addComponent(lblNewLabel_3)
					.addGap(11)
					.addGroup(gl_contentPane.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblNewLabel)
						.addComponent(autorLivro, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
					.addGap(18)
					.addGroup(gl_contentPane.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblNewLabel_2)
						.addComponent(tituloLivro, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
					.addGap(18)
					.addGroup(gl_contentPane.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblNewLabel_1)
						.addComponent(anoLancamento, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
					.addPreferredGap(ComponentPlacement.RELATED, 46, Short.MAX_VALUE)
					.addGroup(gl_contentPane.createParallelGroup(Alignment.BASELINE)
						.addComponent(btnIncluirLivro)
						.addComponent(btnRevista)
						.addComponent(btnListagemLivros))
					.addGap(21))
		);
		contentPane.setLayout(gl_contentPane);
	}
	
	public void cadastrarLivro() throws Exception{
		try {
			String autor, titulo, ano;
			autor = autorLivro.getText();
			titulo = tituloLivro.getText();
			ano = anoLancamento.getText();
			
			if(autor.equals("") || titulo.equals("") || ano.equals("")) {
				throw new Exception("Ainda ha campos vazios!");
			}else {
				Livro livro = new Livro(autor, titulo, Integer.parseInt(ano));
				Livro.addLivro(livro);
				JOptionPane.showMessageDialog(null, "Livro criado!", "", JOptionPane.INFORMATION_MESSAGE);
			}
			
		}catch (Exception e) {
			JOptionPane.showMessageDialog(null, e + "\nNao foi possivel cadastrar seu livro", "Cliente Error", JOptionPane.ERROR_MESSAGE);
		}
	}
	
}
