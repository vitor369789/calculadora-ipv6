from flask import Flask, render_template, request, jsonify
import ipaddress

app = Flask(__name__)

def calculate_subnets(network, new_prefix):
    try:
        network = ipaddress.IPv6Network(network)
        if new_prefix <= network.prefixlen:
            raise ValueError("O novo prefixo deve ser maior que o prefixo atual")
        subnets = list(network.subnets(new_prefix=new_prefix))
        return [str(subnet) for subnet in subnets]
    except Exception as e:
        raise ValueError(f"Erro ao calcular sub-redes: {str(e)}")

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/calculate', methods=['POST'])
def calculate():
    try:
        ipv6_address = request.form.get('ipv6_address')
        new_prefix = request.form.get('new_prefix')
        
        ip = ipaddress.IPv6Interface(ipv6_address)
        network = ip.network
        
        # Break down the IPv6 address
        full_address = ip.ip.exploded
        network_str = network.exploded
        blocks = full_address.split(':')
        
        result = {
            'full_address': full_address,
            'network': network_str,
            'blocks': blocks,
            'compressed': ip.ip.compressed,
            'prefix_length': network.prefixlen,
            'total_addresses': str(network.num_addresses),
            'subnets': []
        }
        
        # Calculate subnets if new_prefix is provided
        if new_prefix and new_prefix.isdigit():
            new_prefix = int(new_prefix)
            if new_prefix > 128:
                raise ValueError("O prefixo não pode ser maior que 128")
            result['subnets'] = calculate_subnets(network, new_prefix)
            result['subnet_count'] = len(result['subnets'])
        
        return jsonify({'success': True, 'result': result})
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)})

if __name__ == '__main__':
    app.run(debug=True)
